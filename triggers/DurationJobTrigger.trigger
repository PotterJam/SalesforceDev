trigger DurationJobTrigger on Duration_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationJobHandler.handleAfterDelete(Trigger.old);
    }
}
