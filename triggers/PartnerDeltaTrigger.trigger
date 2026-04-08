trigger PartnerDeltaTrigger on Partner_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
