({
    handleActive : function(component, event, helper) {
        var tab = event.getSource();
        var healthHeader = component.find("healthHeader");

        //changing the CTHealthHeader (child) title on tab change
        switch (tab.get('v.id')) {
            case 'location_view' :
                healthHeader.set("v.title", "Location View");
                break;
            case 'person_view' :
                healthHeader.set("v.title", "Person View");
                break;
        }
    },
})
