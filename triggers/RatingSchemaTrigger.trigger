trigger RatingSchemaTrigger on Rating_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
