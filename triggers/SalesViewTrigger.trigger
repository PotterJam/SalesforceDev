trigger SalesViewTrigger on Sales_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesViewHandler.handleAfterDelete(Trigger.old);
    }
}
