trigger PartnerTaskTrigger on Partner_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerTaskHandler.handleAfterDelete(Trigger.old);
    }
}
