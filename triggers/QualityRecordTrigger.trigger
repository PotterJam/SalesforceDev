trigger QualityRecordTrigger on Quality_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRecordHandler.handleAfterDelete(Trigger.old);
    }
}
