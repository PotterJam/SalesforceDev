trigger PartnerTriggerTrigger on Partner_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
