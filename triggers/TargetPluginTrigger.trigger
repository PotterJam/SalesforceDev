trigger TargetPluginTrigger on Target_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPluginHandler.handleAfterDelete(Trigger.old);
    }
}
