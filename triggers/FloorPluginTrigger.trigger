trigger FloorPluginTrigger on Floor_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPluginHandler.handleAfterDelete(Trigger.old);
    }
}
