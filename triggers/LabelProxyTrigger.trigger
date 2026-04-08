trigger LabelProxyTrigger on Label_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelProxyHandler.handleAfterDelete(Trigger.old);
    }
}
