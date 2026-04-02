trigger QualityAggregateTrigger on Quality_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
