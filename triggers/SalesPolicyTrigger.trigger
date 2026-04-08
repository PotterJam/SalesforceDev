trigger SalesPolicyTrigger on Sales_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
