trigger PhaseAggregateTrigger on Phase_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
