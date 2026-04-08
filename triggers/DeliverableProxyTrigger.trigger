trigger DeliverableProxyTrigger on Deliverable_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableProxyHandler.handleAfterDelete(Trigger.old);
    }
}
