trigger QualityLogTrigger on Quality_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityLogHandler.handleAfterDelete(Trigger.old);
    }
}
