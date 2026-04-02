trigger PartnerDispatchTrigger on Partner_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
