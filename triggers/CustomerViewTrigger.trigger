trigger CustomerViewTrigger on Customer_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerViewHandler.handleAfterDelete(Trigger.old);
    }
}
