package com.iss.Services;

import com.razorpay.Order;
import com.razorpay.Payment;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;

public class RazorpayService
{
    private RazorpayClient razorpayClient;
    public RazorpayService() throws RazorpayException
    {
    	this.razorpayClient = new RazorpayClient("rzp_test_IA5gXxxWfzsqFs","oEvEzceL4tl4ZjAxOnNYjEQJ");
    }
    public RazorpayService(String keyId, String keySecret) throws RazorpayException
    {
        this.razorpayClient = new RazorpayClient(keyId, keySecret);
    }
    public Order createOrder(int amount, String receipt) throws RazorpayException
    {
    	System.out.println("***************");
        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", (int)(amount* 100));
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", receipt);
        return razorpayClient.orders.create(orderRequest);
    }

    public Payment fetchPayment(String paymentId) throws RazorpayException
    {
        return razorpayClient.payments.fetch(paymentId);
    }

    public void capturePayment(String paymentId, int amount) throws RazorpayException
    {
        JSONObject captureRequest = new JSONObject();
        captureRequest.put("amount", amount);
        razorpayClient.payments.capture(paymentId, captureRequest);
    }
}
