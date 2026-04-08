trigger AssignmentProxyTrigger on Assignment_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentProxyHandler.handleAfterDelete(Trigger.old);
    }
}
