trigger CapacityLinkTrigger on Capacity_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityLinkHandler.handleAfterDelete(Trigger.old);
    }
}
