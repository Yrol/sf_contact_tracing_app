({
    fetchPersonStatus : function(component) {

        const action = component.get("c.getRecentPersonHealthChanges");

        action.setCallback(this, function(response) {
            const state = response.getState();

            if(state === "SUCCESS") {

                //using the getReturnValue (built in method) to get the return value form Apex action/method
                const resp = response.getReturnValue();

                //binding the data to the data table
                component.set("v.data", resp);
            }
        });

        $A.enqueueAction(action);
    }
})
