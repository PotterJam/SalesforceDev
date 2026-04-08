trigger SalesFilterTrigger on Sales_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesFilterHandler.handleAfterDelete(Trigger.old);
    }
}
