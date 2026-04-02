trigger OrderViewTrigger on Order_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderViewHandler.handleAfterDelete(Trigger.old);
    }
}
