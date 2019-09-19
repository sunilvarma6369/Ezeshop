({
doinit : function(component, event, helper) {

        var list1=[];
        for(var i=25;i<38;i++)
        {
            list1.push("test"+i);
        }   
        component.set("v.list",list1);
}
})