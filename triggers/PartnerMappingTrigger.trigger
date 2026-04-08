trigger PartnerMappingTrigger on Partner_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerMappingHandler.handleAfterDelete(Trigger.old);
    }
}
