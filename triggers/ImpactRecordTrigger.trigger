trigger ImpactRecordTrigger on Impact_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRecordHandler.handleAfterDelete(Trigger.old);
    }
}
