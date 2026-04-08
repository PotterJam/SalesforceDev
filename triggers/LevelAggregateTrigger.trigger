trigger LevelAggregateTrigger on Level_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
