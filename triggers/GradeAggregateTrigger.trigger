trigger GradeAggregateTrigger on Grade_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
