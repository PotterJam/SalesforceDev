trigger PartnerPluginTrigger on Partner_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerPluginHandler.handleAfterDelete(Trigger.old);
    }
}
