trigger PartnerStoreTrigger on Partner_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStoreHandler.handleAfterDelete(Trigger.old);
    }
}
