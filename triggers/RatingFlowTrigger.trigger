trigger RatingFlowTrigger on Rating_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingFlowHandler.handleAfterDelete(Trigger.old);
    }
}
