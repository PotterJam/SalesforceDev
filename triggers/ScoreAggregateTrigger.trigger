trigger ScoreAggregateTrigger on Score_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
