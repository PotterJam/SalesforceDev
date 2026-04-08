trigger GradeProxyTrigger on Grade_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeProxyHandler.handleAfterDelete(Trigger.old);
    }
}
