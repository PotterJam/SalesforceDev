trigger PartnerStageTrigger on Partner_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerStageHandler.handleAfterDelete(Trigger.old);
    }
}
