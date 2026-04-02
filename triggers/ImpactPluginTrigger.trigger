trigger ImpactPluginTrigger on Impact_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactPluginHandler.handleAfterDelete(Trigger.old);
    }
}
