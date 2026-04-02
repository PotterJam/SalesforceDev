trigger CustomerDetailTrigger on Customer_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDetailHandler.handleAfterDelete(Trigger.old);
    }
}
