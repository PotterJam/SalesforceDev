trigger ScoreTransformTrigger on Score_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTransformHandler.handleAfterDelete(Trigger.old);
    }
}
