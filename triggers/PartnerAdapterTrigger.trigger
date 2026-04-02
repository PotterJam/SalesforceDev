trigger PartnerAdapterTrigger on Partner_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
