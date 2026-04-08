trigger AlertLogTrigger on Alert_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertLogHandler.handleAfterDelete(Trigger.old);
    }
}
