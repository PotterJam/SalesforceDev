({
    loadWorkflowStatus : function(component) {
        var action = component.get("c.getWorkflowStatus");
        action.setParams({
            accountId : component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.workflowStatus", result.alertInfo);
                component.set("v.activities", result.activities);
            } else {
                var errors = response.getError();
                var message = (errors && errors[0] && errors[0].message)
                    ? errors[0].message
                    : "An error occurred loading workflow status.";
                component.set("v.errorMessage", message);
            }
            component.set("v.isLoading", false);
        });
        $A.enqueueAction(action);
    }
})
