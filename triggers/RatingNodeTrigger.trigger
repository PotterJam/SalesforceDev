trigger RatingNodeTrigger on Rating_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingNodeHandler.handleAfterDelete(Trigger.old);
    }
}
