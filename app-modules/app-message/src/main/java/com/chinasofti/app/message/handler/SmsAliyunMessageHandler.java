package com.chinasofti.app.message.handler;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.chinasofti.app.common.constants.CommonConstant;
import com.chinasofti.app.common.validate.Assert;
import com.chinasofti.app.message.config.SmsAliyunPropertiesConfig;
import com.chinasofti.app.message.template.MobileMsgTemplate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 阿里大鱼短息服务处理
 */
@Slf4j
@Component(CommonConstant.ALIYUN_SMS)
public class SmsAliyunMessageHandler extends AbstractMessageHandler {
    @Autowired
    private SmsAliyunPropertiesConfig smsAliyunPropertiesConfig;
    private static final String PRODUCT = "Dysmsapi";
    private static final String DOMAIN = "dysmsapi.aliyuncs.com";

    /**
     * 数据校验
     *
     * @param mobileMsgTemplate 消息
     */
    @Override
    public void check(MobileMsgTemplate mobileMsgTemplate) {
        Assert.isBlank(mobileMsgTemplate.getMobile(), "手机号不能为空");
        Assert.isBlank(mobileMsgTemplate.getContext(), "短信内容不能为空");
    }

    /**
     * 业务处理
     *
     * @param mobileMsgTemplate 消息
     */
    @Override
    public boolean process(MobileMsgTemplate mobileMsgTemplate) {
        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", smsAliyunPropertiesConfig.getAccessKey(), smsAliyunPropertiesConfig.getSecretKey());
        try {
            DefaultProfile.addEndpoint("cn-hou", "cn-hangzhou", PRODUCT, DOMAIN);
        } catch (ClientException e) {
            log.error("初始化SDK 异常", e);
            e.printStackTrace();
        }
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        //必填:待发送手机号
        request.setPhoneNumbers(mobileMsgTemplate.getMobile());

        //必填:短信签名-可在短信控制台中找到
        request.setSignName(mobileMsgTemplate.getSignName());

        //必填:短信模板-可在短信控制台中找到
        request.setTemplateCode(smsAliyunPropertiesConfig.getChannels().get(mobileMsgTemplate.getTemplate()));

        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"
        request.setTemplateParam(mobileMsgTemplate.getContext());
        request.setOutId(mobileMsgTemplate.getMobile());

        //hint 此处可能会抛出异常，注意catch
        try {
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            log.info("短信发送完毕，手机号：{}，返回状态：{}", mobileMsgTemplate.getMobile(), sendSmsResponse.getCode());
        } catch (ClientException e) {
            log.error("发送异常");
            e.printStackTrace();
        }
        return true;
    }

    /**
     * 失败处理
     *
     * @param mobileMsgTemplate 消息
     */
    @Override
    public void fail(MobileMsgTemplate mobileMsgTemplate) {
        log.error("短信发送失败 -> 网关：{} -> 手机号：{}", mobileMsgTemplate.getType(), mobileMsgTemplate.getMobile());
    }
}
