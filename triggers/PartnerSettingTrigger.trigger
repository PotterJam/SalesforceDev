trigger PartnerSettingTrigger on Partner_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerSettingHandler.handleAfterDelete(Trigger.old);
    }
}
