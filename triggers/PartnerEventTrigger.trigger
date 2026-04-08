trigger PartnerEventTrigger on Partner_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerEventHandler.handleAfterDelete(Trigger.old);
    }
}
