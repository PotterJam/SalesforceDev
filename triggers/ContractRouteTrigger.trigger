trigger ContractRouteTrigger on Contract_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRouteHandler.handleAfterDelete(Trigger.old);
    }
}
