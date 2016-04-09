package test.unittest;
import org.apache.struts2.StrutsSpringTestCase;

import com.opensymphony.xwork2.ActionProxy;

public class TestAccountActionUsingStrutsTestCase extends StrutsSpringTestCase  {
 
    public void testUserNameErrorMessage() throws Exception {
 
        request.setParameter("accountBean.userName", "Bruc");
        request.setParameter("accountBean.password", "test");
 
        ActionProxy proxy = getActionProxy("/createaccount");
 
        AccountAction accountAction = (AccountAction) proxy.getAction();
 
        proxy.execute();
 
        assertTrue("Problem There were no errors present in fieldErrors but there should have been one error present", accountAction.getFieldErrors().size() == 1);
        assertTrue("Problem field account.userName not present in fieldErrors but it should have been",
                accountAction.getFieldErrors().containsKey("accountBean.userName") );
 
    }
 
    public void testUserNameCorrect() throws Exception {
 
        request.setParameter("accountBean.userName", "Bruce");
        request.setParameter("accountBean.password", "test");
 
        ActionProxy proxy = getActionProxy("/createaccount");
 
        AccountAction accountAction = (AccountAction) proxy.getAction();
 
        String result = proxy.execute();
 
        assertTrue("Problem There were errors present in fieldErrors but there should not have been any errors present", accountAction.getFieldErrors().size() == 0);
        assertEquals("Result returned form executing the action was not success but it should have been.", "success", result);
 
    }
 
}