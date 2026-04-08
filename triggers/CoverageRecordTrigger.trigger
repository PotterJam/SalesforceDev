trigger CoverageRecordTrigger on Coverage_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageRecordHandler.handleAfterDelete(Trigger.old);
    }
}
