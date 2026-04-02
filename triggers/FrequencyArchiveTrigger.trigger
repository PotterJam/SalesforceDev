trigger FrequencyArchiveTrigger on Frequency_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
