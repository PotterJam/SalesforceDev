trigger CustomerNodeTrigger on Customer_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerNodeHandler.handleAfterDelete(Trigger.old);
    }
}
