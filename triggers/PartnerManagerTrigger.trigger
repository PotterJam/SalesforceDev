trigger PartnerManagerTrigger on Partner_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerManagerHandler.handleAfterDelete(Trigger.old);
    }
}
