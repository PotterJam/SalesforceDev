trigger ScoreRegistryTrigger on Score_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
