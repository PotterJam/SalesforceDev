trigger SalesConfigTrigger on Sales_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesConfigHandler.handleAfterDelete(Trigger.old);
    }
}
