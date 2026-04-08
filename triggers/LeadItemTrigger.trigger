trigger LeadItemTrigger on Lead_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadItemHandler.handleAfterDelete(Trigger.old);
    }
}
